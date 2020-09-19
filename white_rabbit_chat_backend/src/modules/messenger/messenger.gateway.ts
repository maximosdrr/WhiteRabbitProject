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
import { Message } from './entities/message.entity';
import { MessengerService } from './messenger.service';

@Injectable()
@WebSocketGateway()
export class MessengerGateway
  implements OnGatewayInit, OnGatewayConnection, OnGatewayDisconnect {
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
  async handleMessage(payload: Message): Promise<any> {
    this.server.emit('msgToClient', payload);
  }
}
