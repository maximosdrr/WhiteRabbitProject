import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { DeleteResult, Repository } from 'typeorm';
import { User } from '../../entities/user.entity';

@Injectable()
export class UserRepo {
  constructor(@InjectRepository(User) private readonly db: Repository<User>) {}

  async insert(user: User): Promise<User> {
    return await this.db.save(user);
  }

  async findOne(id: string): Promise<User> {
    return await this.db.findOne(id);
  }

  async findByUsernameAndPassword(
    username: string,
    password: string,
  ): Promise<User> {
    return await this.db.findOne({
      where: {
        username: username,
        password: password,
      },
    });
  }

  async update(user: User): Promise<User> {
    return await this.db.save(user);
  }

  async delete(id: string): Promise<DeleteResult> {
    return await this.db.delete(id);
  }

  async getConnectedUsers(): Promise<User[]> {
    return await this.db.find({
      where: {
        online: true,
      },
    });
  }
}
