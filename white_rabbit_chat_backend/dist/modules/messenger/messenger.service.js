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
exports.MessengerService = void 0;
const common_1 = require("@nestjs/common");
const handler_1 = require("./repositories/message/handler");
let MessengerService = class MessengerService {
    constructor(messageRepositoryHandler) {
        this.messageRepositoryHandler = messageRepositoryHandler;
    }
    async insert(message) {
        return await this.messageRepositoryHandler.insert(message);
    }
    async findAll() {
        return await this.messageRepositoryHandler.findAll();
    }
    async delete(id) {
        return await this.messageRepositoryHandler.delete(id);
    }
};
MessengerService = __decorate([
    common_1.Injectable(),
    __metadata("design:paramtypes", [handler_1.MessageRepositoryHandler])
], MessengerService);
exports.MessengerService = MessengerService;
//# sourceMappingURL=messenger.service.js.map