import { Injectable } from '@nestjs/common';
import { use } from 'passport';
import { User } from './entities/user.entity';
import { UserRepositoryHandler } from './repositories/user/handler';

@Injectable()
export class UserService {
  constructor(private readonly handler: UserRepositoryHandler) {}
  async insert(user: User): Promise<User> {
    return this.handler.insert(user);
  }

  async delete(id: string): Promise<boolean> {
    return await this.handler.deleteUser(id);
  }

  async updateUserStatus(id: string, status: boolean): Promise<User> {
    return await this.handler.updateUserStatus(id, status);
  }

  async getConnectedUsers(): Promise<User[]> {
    return await this.handler.getConnectedUsers();
  }
}
