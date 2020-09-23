/* eslint-disable @typescript-eslint/explicit-module-boundary-types */
import { Injectable, Logger } from '@nestjs/common';
import {
  OnGatewayConnection,
  OnGatewayDisconnect,
  OnGatewayInit,
  SubscribeMessage,
  WebSocketGateway,
  WebSocketServer,
} from '@nestjs/websockets';
import { Server } from 'http';
import { Client } from 'socket.io';
import { Message } from '../../entities/message.entity';

@Injectable()
@WebSocketGateway()
export class MessengerGateway
  implements OnGatewayInit, OnGatewayConnection, OnGatewayDisconnect {
  private logger: Logger = new Logger('AppGateway');
  @WebSocketServer() server: Server;
  afterInit(server) {
    return null;
  }
  handleConnection(client: any, ...args: any[]) {
    return null;
  }
  handleDisconnect(client: any) {
    return null;
  }

  @SubscribeMessage('messageToServer')
  async handleMessage(client: Client, payload: Message): Promise<any> {
    this.server.emit('msgToClient', payload);
    this.logger.warn(`Nova mensagem recebida: ${payload.content}`);
  }
}
