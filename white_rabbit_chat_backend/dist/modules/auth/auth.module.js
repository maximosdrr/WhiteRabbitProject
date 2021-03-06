"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.AuthModule = void 0;
const common_1 = require("@nestjs/common");
const jwt_1 = require("@nestjs/jwt");
const typeorm_1 = require("@nestjs/typeorm");
const user_entity_1 = require("../../entities/user.entity");
const handler_1 = require("../user/repositories/user/handler");
const repository_1 = require("../user/repositories/user/repository");
const auth_service_1 = require("./auth.service");
const local_strategy_1 = require("./strategy/local.strategy");
const auth_controller_1 = require("./auth.controller");
const jwt_strategy_1 = require("./strategy/jwt.strategy");
let AuthModule = class AuthModule {
};
AuthModule = __decorate([
    common_1.Module({
        providers: [
            auth_service_1.AuthService,
            repository_1.UserRepo,
            handler_1.UserRepositoryHandler,
            local_strategy_1.LocalStrategy,
            jwt_strategy_1.JwtStrategy,
        ],
        imports: [
            typeorm_1.TypeOrmModule.forFeature([user_entity_1.User]),
            jwt_1.JwtModule.registerAsync({
                useFactory: async () => ({
                    secret: process.env.SECRET,
                    signOptions: {
                        expiresIn: process.env.JWT_EXPIRATION_TIME,
                    },
                }),
            }),
        ],
        controllers: [auth_controller_1.AuthController],
        exports: [],
    })
], AuthModule);
exports.AuthModule = AuthModule;
//# sourceMappingURL=auth.module.js.map