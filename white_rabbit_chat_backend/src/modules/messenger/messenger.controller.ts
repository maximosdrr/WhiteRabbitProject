import {
  Body,
  Controller,
  Delete,
  Get,
  Param,
  Post,
  Req,
  UseGuards,
} from '@nestjs/common';
import { JwtAuthGuard } from '../auth/guards/jwt-auth.guard';
import { Message } from '../../entities/message.entity';
import { MessengerGateway } from './messenger.gateway';
import { MessengerService } from './messenger.service';

@UseGuards(JwtAuthGuard)
@Controller('messenger')
export class MessengerController {
  constructor(
    private readonly messengerService: MessengerService,
    private readonly messengeGateway: MessengerGateway,
  ) {}
  @Post('insert')
  // eslint-disable-next-line @typescript-eslint/explicit-module-boundary-types
  async insert(@Body() message: Message, @Req() req): Promise<Message> {
    message.user = req.user;
    this.messengeGateway.handleMessage(null, message);
    return await this.messengerService.insert(message);
  }

  @Get('find')
  async findAll(): Promise<Message[]> {
    return await this.messengerService.findAll();
  }

  @Delete('delete/:id')
  async delete(@Param('id') id: string): Promise<boolean> {
    return await this.messengerService.delete(id);
  }
}
