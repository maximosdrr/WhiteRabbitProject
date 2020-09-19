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
exports.MessengerGateway = void 0;
const common_1 = require("@nestjs/common");
const websockets_1 = require("@nestjs/websockets");
const http_1 = require("http");
const message_entity_1 = require("./entities/message.entity");
let MessengerGateway = class MessengerGateway {
    afterInit(server) {
        return null;
    }
    handleConnection(client, ...args) {
        return null;
    }
    handleDisconnect(client) {
        return null;
    }
    async handleMessage(payload) {
        this.server.emit('msgToClient', payload);
    }
};
__decorate([
    websockets_1.WebSocketServer(),
    __metadata("design:type", http_1.Server)
], MessengerGateway.prototype, "server", void 0);
__decorate([
    websockets_1.SubscribeMessage('messageToServer'),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [message_entity_1.Message]),
    __metadata("design:returntype", Promise)
], MessengerGateway.prototype, "handleMessage", null);
MessengerGateway = __decorate([
    common_1.Injectable(),
    websockets_1.WebSocketGateway()
], MessengerGateway);
exports.MessengerGateway = MessengerGateway;
//# sourceMappingURL=messenger.gateway.js.map