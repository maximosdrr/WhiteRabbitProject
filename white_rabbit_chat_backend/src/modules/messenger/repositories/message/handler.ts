import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { Message } from '../../entities/message.entity';
import { MessageRepo } from './repository';

@Injectable()
export class MessageRepositoryHandler {
  constructor(private readonly messageRepo: MessageRepo) {}

  async insert(message: Message): Promise<Message> {
    try {
      return await this.messageRepo.insert(message);
    } catch (e) {
      throw new HttpException(
        'Um erro inesperado ocorreu ao tentar enviar a mensagem',
        HttpStatus.BAD_REQUEST,
      );
    }
  }

  async findAll(): Promise<Message[]> {
    try {
      return this.removeUserPassword(await this.messageRepo.findAll());
    } catch (e) {
      throw new HttpException(
        'Um erro inesperado ocorreu ao tentar recuperar as mensagens',
        HttpStatus.BAD_REQUEST,
      );
    }
  }

  async delete(messageId: string): Promise<boolean> {
    try {
      const result = await this.messageRepo.delete(messageId);
      if (!result.affected) return false;
      return true;
    } catch (e) {
      throw new HttpException(
        'Algo deu errado ao tentar deletar a mensagem',
        HttpStatus.BAD_REQUEST,
      );
    }
  }

  private removeUserPassword(messages: Message[]): Message[] {
    const result = messages.map(message => {
      if (!message.user.password) {
        return message;
      }

      message.user.password = undefined;
      return message;
    });

    return result;
  }
}
