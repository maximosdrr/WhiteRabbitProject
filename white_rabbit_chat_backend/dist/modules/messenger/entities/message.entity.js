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
exports.Message = void 0;
const user_entity_1 = require("../../user/entities/user.entity");
const typeorm_1 = require("typeorm");
let Message = class Message {
};
__decorate([
    typeorm_1.PrimaryGeneratedColumn('uuid'),
    __metadata("design:type", String)
], Message.prototype, "id", void 0);
__decorate([
    typeorm_1.Column({ default: 'Mensagem vazia' }),
    __metadata("design:type", String)
], Message.prototype, "content", void 0);
__decorate([
    typeorm_1.ManyToOne(type => user_entity_1.User, user => user.message, { nullable: false }),
    __metadata("design:type", user_entity_1.User)
], Message.prototype, "user", void 0);
__decorate([
    typeorm_1.CreateDateColumn(),
    __metadata("design:type", String)
], Message.prototype, "createdAt", void 0);
Message = __decorate([
    typeorm_1.Entity()
], Message);
exports.Message = Message;
//# sourceMappingURL=message.entity.js.map