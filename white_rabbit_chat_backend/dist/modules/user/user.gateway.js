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
exports.UserGateway = void 0;
const common_1 = require("@nestjs/common");
const websockets_1 = require("@nestjs/websockets");
const http_1 = require("http");
let UserGateway = class UserGateway {
    constructor() {
        this.logger = new common_1.Logger('AppGateway');
    }
    afterInit(server) {
        return null;
    }
    handleConnection(client, ...args) {
        this.logger.warn(`Cliente: ${client.id} conectado`);
    }
    handleDisconnect(client) {
        this.logger.log(`Cliente: ${client.id} desconectado`);
    }
    async updateOnlineList(payload) {
        this.server.emit('reciveUpdatedOnlineClientList', payload);
    }
    async teste(payload) {
        this.logger.log('Teste Recebido ' + payload);
        this.server.emit('testeToClient', 'Teste bem sucessido');
    }
};
__decorate([
    websockets_1.WebSocketServer(),
    __metadata("design:type", http_1.Server)
], UserGateway.prototype, "server", void 0);
__decorate([
    websockets_1.SubscribeMessage('updateOnlineClientList'),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Array]),
    __metadata("design:returntype", Promise)
], UserGateway.prototype, "updateOnlineList", null);
__decorate([
    websockets_1.SubscribeMessage('testeToServer'),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Object]),
    __metadata("design:returntype", Promise)
], UserGateway.prototype, "teste", null);
UserGateway = __decorate([
    common_1.Injectable(),
    websockets_1.WebSocketGateway()
], UserGateway);
exports.UserGateway = UserGateway;
//# sourceMappingURL=user.gateway.js.map