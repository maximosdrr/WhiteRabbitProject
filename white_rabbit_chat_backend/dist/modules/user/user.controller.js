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
var __param = (this && this.__param) || function (paramIndex, decorator) {
    return function (target, key) { decorator(target, key, paramIndex); }
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.UserController = void 0;
const common_1 = require("@nestjs/common");
const jwt_auth_guard_1 = require("../auth/guards/jwt-auth.guard");
const user_entity_1 = require("./entities/user.entity");
const user_gateway_1 = require("./user.gateway");
const user_service_1 = require("./user.service");
let UserController = class UserController {
    constructor(userService, userGateway) {
        this.userService = userService;
        this.userGateway = userGateway;
    }
    async insertUser(user) {
        return this.userService.insert(user);
    }
    async deleteUser(req) {
        return await this.userService.delete(req.user.id);
    }
    async connectUserInTheServer(req) {
        await this.userService.updateUserStatus(req.user.id, true);
        const connectedUsers = await this.userService.getConnectedUsers();
        this.userGateway.updateOnlineList(connectedUsers);
        return { connected: req.user.id };
    }
    async disconnectUserInTheServer(req) {
        await this.userService.updateUserStatus(req.user.id, false);
        const connectedUsers = await this.userService.getConnectedUsers();
        this.userGateway.updateOnlineList(connectedUsers);
        return { disconnected: req.user.id };
    }
};
__decorate([
    common_1.Post('insert'),
    __param(0, common_1.Body()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [user_entity_1.User]),
    __metadata("design:returntype", Promise)
], UserController.prototype, "insertUser", null);
__decorate([
    common_1.Delete('delete'),
    common_1.UseGuards(jwt_auth_guard_1.JwtAuthGuard),
    __param(0, common_1.Req()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Object]),
    __metadata("design:returntype", Promise)
], UserController.prototype, "deleteUser", null);
__decorate([
    common_1.Get('connect'),
    common_1.UseGuards(jwt_auth_guard_1.JwtAuthGuard),
    __param(0, common_1.Req()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Object]),
    __metadata("design:returntype", Promise)
], UserController.prototype, "connectUserInTheServer", null);
__decorate([
    common_1.Get('disconnect'),
    common_1.UseGuards(jwt_auth_guard_1.JwtAuthGuard),
    __param(0, common_1.Req()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Object]),
    __metadata("design:returntype", Promise)
], UserController.prototype, "disconnectUserInTheServer", null);
UserController = __decorate([
    common_1.Controller('user'),
    __metadata("design:paramtypes", [user_service_1.UserService,
        user_gateway_1.UserGateway])
], UserController);
exports.UserController = UserController;
//# sourceMappingURL=user.controller.js.map