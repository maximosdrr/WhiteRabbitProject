/// <reference types="node" />
import { OnGatewayConnection, OnGatewayDisconnect, OnGatewayInit } from '@nestjs/websockets';
import { Server } from 'http';
import { User } from '../../entities/user.entity';
export declare class UserGateway implements OnGatewayInit, OnGatewayConnection, OnGatewayDisconnect {
    private logger;
    server: Server;
    afterInit(server: any): any;
    handleConnection(client: any, ...args: any[]): void;
    handleDisconnect(client: any): void;
    updateOnlineList(payload: User[]): Promise<any>;
    teste(payload: any): Promise<any>;
}
