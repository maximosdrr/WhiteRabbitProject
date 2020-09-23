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
exports.MessengerController = void 0;
const common_1 = require("@nestjs/common");
const jwt_auth_guard_1 = require("../auth/guards/jwt-auth.guard");
const message_entity_1 = require("../../entities/message.entity");
const messenger_gateway_1 = require("./messenger.gateway");
const messenger_service_1 = require("./messenger.service");
let MessengerController = class MessengerController {
    constructor(messengerService, messengeGateway) {
        this.messengerService = messengerService;
        this.messengeGateway = messengeGateway;
    }
    async insert(message, req) {
        message.user = req.user;
        this.messengeGateway.handleMessage(null, message);
        return await this.messengerService.insert(message);
    }
    async findAll() {
        return await this.messengerService.findAll();
    }
    async delete(id) {
        return await this.messengerService.delete(id);
    }
};
__decorate([
    common_1.Post('insert'),
    __param(0, common_1.Body()), __param(1, common_1.Req()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [message_entity_1.Message, Object]),
    __metadata("design:returntype", Promise)
], MessengerController.prototype, "insert", null);
__decorate([
    common_1.Get('find'),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", []),
    __metadata("design:returntype", Promise)
], MessengerController.prototype, "findAll", null);
__decorate([
    common_1.Delete('delete/:id'),
    __param(0, common_1.Param('id')),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String]),
    __metadata("design:returntype", Promise)
], MessengerController.prototype, "delete", null);
MessengerController = __decorate([
    common_1.UseGuards(jwt_auth_guard_1.JwtAuthGuard),
    common_1.Controller('messenger'),
    __metadata("design:paramtypes", [messenger_service_1.MessengerService,
        messenger_gateway_1.MessengerGateway])
], MessengerController);
exports.MessengerController = MessengerController;
//# sourceMappingURL=messenger.controller.js.map