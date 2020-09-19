import { Injectable } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt/dist/jwt.service';
import { UserRepositoryHandler } from '../user/repositories/user/handler';

@Injectable()
export class AuthService {
  constructor(
    private readonly userRepositoryHandler: UserRepositoryHandler,
    private readonly jwtService: JwtService,
  ) {}
  async validateUser(username: string, password: string): Promise<any> {
    const user = await this.userRepositoryHandler.findOneByUsernameAndPassword(
      username,
      password,
    );
    if (user && user.password == password) {
      const { password, ...result } = user;
      return result;
    }
    return null;
  }

  // eslint-disable-next-line @typescript-eslint/explicit-module-boundary-types
  async login(user: any): Promise<any> {
    const payload = {
      username: user.username,
      id: user.id,
      icon: user.icon,
      name: user.name,
    };
    return {
      access_token: this.jwtService.sign(payload),
    };
  }
}
