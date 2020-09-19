import { Injectable, Logger } from '@nestjs/common';
/* eslint-disable @typescript-eslint/explicit-module-boundary-types */
import {
  OnGatewayConnection,
  OnGatewayDisconnect,
  OnGatewayInit,
  SubscribeMessage,
  WebSocketGateway,
  WebSocketServer,
} from '@nestjs/websockets';
import { Server } from 'http';
import { User } from './entities/user.entity';
import { UserService } from './user.service';

@Injectable()
@WebSocketGateway()
export class UserGateway
  implements OnGatewayInit, OnGatewayConnection, OnGatewayDisconnect {
  private logger: Logger = new Logger('AppGateway');
  @WebSocketServer() server: Server;

  afterInit(server: any) {
    return null;
  }
  handleConnection(client: any, ...args: any[]) {
    this.logger.log(`Cliente: ${client.id} conectado`);
  }
  handleDisconnect(client: any) {
    return null;
  }

  @SubscribeMessage('updateOnlineClientList')
  async updateOnlineList(payload: User[]): Promise<any> {
    this.server.emit('reciveUpdatedOnlineClientList', payload);
  }
}
