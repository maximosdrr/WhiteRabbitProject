"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.MessageRepositoryHandler = void 0;
const common_1 = require("@nestjs/common");
const repository_1 = require("./repository");
let MessageRepositoryHandler = class MessageRepositoryHandler {
    constructor(messageRepo) {
        this.messageRepo = messageRepo;
    }
    async insert(message) {
        try {
            return await this.messageRepo.insert(message);
        }
        catch (e) {
            throw new common_1.HttpException('Um erro inesperado ocorreu ao tentar enviar a mensagem', common_1.HttpStatus.BAD_REQUEST);
        }
    }
    async findAll() {
        try {
            return this.removeUserPassword(await this.messageRepo.findAll());
        }
        catch (e) {
            throw new common_1.HttpException('Um erro inesperado ocorreu ao tentar recuperar as mensagens', common_1.HttpStatus.BAD_REQUEST);
        }
    }
    async delete(messageId) {
        try {
            const result = await this.messageRepo.delete(messageId);
            if (!result.affected)
                return false;
            return true;
        }
        catch (e) {
            throw new common_1.HttpException('Algo deu errado ao tentar deletar a mensagem', common_1.HttpStatus.BAD_REQUEST);
        }
    }
    removeUserPassword(messages) {
        const result = messages.map(message => {
            if (!message.user.password) {
                return message;
            }
            message.user.password = undefined;
            return message;
        });
        return result;
    }
};
MessageRepositoryHandler = __decorate([
    common_1.Injectable(),
    __metadata("design:paramtypes", [repository_1.MessageRepo])
], MessageRepositoryHandler);
exports.MessageRepositoryHandler = MessageRepositoryHandler;
//# sourceMappingURL=handler.js.map