/// <reference types="node" />
import { OnGatewayConnection, OnGatewayDisconnect, OnGatewayInit } from '@nestjs/websockets';
import { Server } from 'http';
import { Client } from 'socket.io';
import { Message } from '../../entities/message.entity';
export declare class MessengerGateway implements OnGatewayInit, OnGatewayConnection, OnGatewayDisconnect {
    server: Server;
    afterInit(server: any): any;
    handleConnection(client: any, ...args: any[]): any;
    handleDisconnect(client: any): any;
    handleMessage(client: Client, payload: Message): Promise<any>;
}
