import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { User } from '../../entities/user.entity';
import { UserRepo } from './repository';

@Injectable()
export class UserRepositoryHandler {
  constructor(private readonly userRepo: UserRepo) {}

  async insert(user: User): Promise<User> {
    try {
      return await this.userRepo.insert(user);
    } catch (e) {
      throw new HttpException(
        `Erro ao tentar cadastrar usuario: ${e || 'Erro não identificado'}`,
        HttpStatus.BAD_REQUEST,
      );
    }
  }

  async findOneByUsernameAndPassword(
    username: string,
    password: string,
  ): Promise<User> {
    try {
      return await this.userRepo.findByUsernameAndPassword(username, password);
    } catch (e) {
      throw new HttpException(
        `Ocorreu um erro interno ao tentar recuperar este usuario ${e ||
          'Erro não identificado'}`,
        HttpStatus.BAD_REQUEST,
      );
    }
  }

  async updateUserStatus(id: string, status: boolean): Promise<User> {
    try {
      const userToUpdate = await this.userRepo.findOne(id);
      userToUpdate.online = status;
      return this.userRepo.update(userToUpdate);
    } catch (e) {
      throw new HttpException(
        'Erro ao tentar atualizar usuario',
        HttpStatus.BAD_REQUEST,
      );
    }
  }

  async deleteUser(id: string): Promise<boolean> {
    try {
      const result = await this.userRepo.delete(id);
      if (result.affected) return true;
      return false;
    } catch (e) {
      throw new HttpException(
        `Ocorreu um erro ao tentar deletar esse usuario ${e ||
          'Erro não identificado'}`,
        HttpStatus.BAD_REQUEST,
      );
    }
  }

  async getConnectedUsers(): Promise<User[]> {
    try {
      return this.filterUserInfo(await this.userRepo.getConnectedUsers());
    } catch (e) {
      throw new HttpException(
        `Ocorreu um erro ao tentar deletar esse usuario ${e ||
          'Erro não identificado'}`,
        HttpStatus.BAD_REQUEST,
      );
    }
  }

  private filterUserInfo(users: User[]): User[] {
    const result = users.map(user => {
      if (user.password) {
        user.password = undefined;
      }

      if (user.username) {
        user.username = undefined;
      }

      if (user.id) {
        user.id = undefined;
      }

      return user;
    });

    return result;
  }
}
