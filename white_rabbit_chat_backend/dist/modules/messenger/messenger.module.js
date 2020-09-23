"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.MessengerModule = void 0;
const common_1 = require("@nestjs/common");
const messenger_service_1 = require("./messenger.service");
const messenger_controller_1 = require("./messenger.controller");
const repository_1 = require("./repositories/message/repository");
const handler_1 = require("./repositories/message/handler");
const typeorm_1 = require("@nestjs/typeorm");
const message_entity_1 = require("../../entities/message.entity");
const messenger_gateway_1 = require("./messenger.gateway");
let MessengerModule = class MessengerModule {
};
MessengerModule = __decorate([
    common_1.Module({
        providers: [
            messenger_service_1.MessengerService,
            repository_1.MessageRepo,
            handler_1.MessageRepositoryHandler,
            messenger_gateway_1.MessengerGateway,
        ],
        controllers: [messenger_controller_1.MessengerController],
        imports: [typeorm_1.TypeOrmModule.forFeature([message_entity_1.Message])],
    })
], MessengerModule);
exports.MessengerModule = MessengerModule;
//# sourceMappingURL=messenger.module.js.map