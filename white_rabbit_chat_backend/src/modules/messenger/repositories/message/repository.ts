import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { DeleteResult, Repository } from 'typeorm';
import { Message } from '../../entities/message.entity';

@Injectable()
export class MessageRepo {
  constructor(
    @InjectRepository(Message) private readonly db: Repository<Message>,
  ) {}

  async insert(message: Message): Promise<Message> {
    return await this.db.save(message);
  }

  async findAll(): Promise<Message[]> {
    return await this.db.find({
      order: { createdAt: 'ASC' },
      join: {
        alias: 'm',
        leftJoinAndSelect: {
          author: 'm.user',
        },
      },
    });
  }

  async delete(id: string): Promise<DeleteResult> {
    return await this.db.delete(id);
  }
}
