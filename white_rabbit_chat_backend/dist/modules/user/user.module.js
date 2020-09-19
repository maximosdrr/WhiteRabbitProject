"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.UserModule = void 0;
const common_1 = require("@nestjs/common");
const user_service_1 = require("./user.service");
const user_controller_1 = require("./user.controller");
const typeorm_1 = require("@nestjs/typeorm");
const user_entity_1 = require("./entities/user.entity");
const repository_1 = require("./repositories/user/repository");
const handler_1 = require("./repositories/user/handler");
const user_gateway_1 = require("./user.gateway");
let UserModule = class UserModule {
};
UserModule = __decorate([
    common_1.Module({
        providers: [user_service_1.UserService, repository_1.UserRepo, handler_1.UserRepositoryHandler, user_gateway_1.UserGateway],
        controllers: [user_controller_1.UserController],
        imports: [typeorm_1.TypeOrmModule.forFeature([user_entity_1.User])],
        exports: [handler_1.UserRepositoryHandler, repository_1.UserRepo],
    })
], UserModule);
exports.UserModule = UserModule;
//# sourceMappingURL=user.module.js.map