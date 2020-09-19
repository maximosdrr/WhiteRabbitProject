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
exports.UserRepositoryHandler = void 0;
const common_1 = require("@nestjs/common");
const repository_1 = require("./repository");
let UserRepositoryHandler = class UserRepositoryHandler {
    constructor(userRepo) {
        this.userRepo = userRepo;
    }
    async insert(user) {
        try {
            return await this.userRepo.insert(user);
        }
        catch (e) {
            throw new common_1.HttpException(`Erro ao tentar cadastrar usuario: ${e || 'Erro não identificado'}`, common_1.HttpStatus.BAD_REQUEST);
        }
    }
    async findOneByUsernameAndPassword(username, password) {
        try {
            return await this.userRepo.findByUsernameAndPassword(username, password);
        }
        catch (e) {
            throw new common_1.HttpException(`Ocorreu um erro interno ao tentar recuperar este usuario ${e ||
                'Erro não identificado'}`, common_1.HttpStatus.BAD_REQUEST);
        }
    }
    async updateUserStatus(id, status) {
        try {
            const userToUpdate = await this.userRepo.findOne(id);
            userToUpdate.online = status;
            return this.userRepo.update(userToUpdate);
        }
        catch (e) {
            throw new common_1.HttpException('Erro ao tentar atualizar usuario', common_1.HttpStatus.BAD_REQUEST);
        }
    }
    async deleteUser(id) {
        try {
            const result = await this.userRepo.delete(id);
            if (result.affected)
                return true;
            return false;
        }
        catch (e) {
            throw new common_1.HttpException(`Ocorreu um erro ao tentar deletar esse usuario ${e ||
                'Erro não identificado'}`, common_1.HttpStatus.BAD_REQUEST);
        }
    }
    async getConnectedUsers() {
        try {
            return this.filterUserInfo(await this.userRepo.getConnectedUsers());
        }
        catch (e) {
            throw new common_1.HttpException(`Ocorreu um erro ao tentar deletar esse usuario ${e ||
                'Erro não identificado'}`, common_1.HttpStatus.BAD_REQUEST);
        }
    }
    filterUserInfo(users) {
        const result = users.map(user => {
            if (user.password) {
                user.password = undefined;
            }
            if (user.username) {
                user.username = undefined;
            }
            if (user.id) {
                user.id = undefined;
            }
            return user;
        });
        return result;
    }
};
UserRepositoryHandler = __decorate([
    common_1.Injectable(),
    __metadata("design:paramtypes", [repository_1.UserRepo])
], UserRepositoryHandler);
exports.UserRepositoryHandler = UserRepositoryHandler;
//# sourceMappingURL=handler.js.map