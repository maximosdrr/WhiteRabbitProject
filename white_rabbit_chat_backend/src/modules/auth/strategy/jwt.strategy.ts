import { ExtractJwt, Strategy } from 'passport-jwt';
import { PassportStrategy } from '@nestjs/passport';
import { Injectable } from '@nestjs/common';

@Injectable()
export class JwtStrategy extends PassportStrategy(Strategy) {
  constructor() {
    super({
      jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken(),
      ignoreExpiration: false,
      secretOrKey: process.env.SECRET,
    });
  }

  async validate(payload: {
    username: string;
    id: string;
    icon: string;
    name: string;
  }): Promise<any> {
    return {
      id: payload.id,
      username: payload.username,
      name: payload.name,
      icon: payload.icon,
    };
  }
}
