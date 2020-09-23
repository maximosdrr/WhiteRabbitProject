/* eslint-disable @typescript-eslint/explicit-module-boundary-types */
import {
  Body,
  Controller,
  Delete,
  Get,
  Post,
  Req,
  UseGuards,
} from '@nestjs/common';
import { JwtAuthGuard } from '../auth/guards/jwt-auth.guard';
import { User } from '../../entities/user.entity';
import { UserGateway } from './user.gateway';
import { UserService } from './user.service';

@Controller('user')
export class UserController {
  constructor(
    private readonly userService: UserService,
    private readonly userGateway: UserGateway,
  ) {}

  @Post('insert')
  async insertUser(@Body() user: User): Promise<User> {
    return this.userService.insert(user);
  }

  @Delete('delete')
  @UseGuards(JwtAuthGuard)
  async deleteUser(@Req() req: any): Promise<boolean> {
    return await this.userService.delete(req.user.id);
  }

  @Get('connect')
  @UseGuards(JwtAuthGuard)
  async connectUserInTheServer(@Req() req: any): Promise<any> {
    await this.userService.updateUserStatus(req.user.id, true);
    const connectedUsers = await this.userService.getConnectedUsers();
    this.userGateway.updateOnlineList(connectedUsers);
    return { connected: req.user.id };
  }

  @Get('disconnect')
  @UseGuards(JwtAuthGuard)
  async disconnectUserInTheServer(@Req() req: any): Promise<any> {
    await this.userService.updateUserStatus(req.user.id, false);
    const connectedUsers = await this.userService.getConnectedUsers();
    this.userGateway.updateOnlineList(connectedUsers);
    return { disconnected: req.user.id };
  }
}
