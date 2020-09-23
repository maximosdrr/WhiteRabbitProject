import { Module } from '@nestjs/common';
import { MessengerService } from './messenger.service';
import { MessengerController } from './messenger.controller';
import { MessageRepo } from './repositories/message/repository';
import { MessageRepositoryHandler } from './repositories/message/handler';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Message } from '../../entities/message.entity';
import { MessengerGateway } from './messenger.gateway';

@Module({
  providers: [
    MessengerService,
    MessageRepo,
    MessageRepositoryHandler,
    MessengerGateway,
  ],
  controllers: [MessengerController],
  imports: [TypeOrmModule.forFeature([Message])],
})
export class MessengerModule {}
