import { Injectable } from '@nestjs/common';
import { Message } from './entities/message.entity';
import { MessageRepositoryHandler } from './repositories/message/handler';

@Injectable()
export class MessengerService {
  constructor(
    private readonly messageRepositoryHandler: MessageRepositoryHandler,
  ) {}

  async insert(message: Message): Promise<Message> {
    return await this.messageRepositoryHandler.insert(message);
  }

  async findAll(): Promise<Message[]> {
    return await this.messageRepositoryHandler.findAll();
  }

  async delete(id: string): Promise<boolean> {
    return await this.messageRepositoryHandler.delete(id);
  }
}
