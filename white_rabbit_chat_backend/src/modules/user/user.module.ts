import { Module } from '@nestjs/common';
import { UserService } from './user.service';
import { UserController } from './user.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { User } from '../../entities/user.entity';
import { UserRepo } from './repositories/user/repository';
import { UserRepositoryHandler } from './repositories/user/handler';
import { JwtService } from '@nestjs/jwt';
import { AuthModule } from '../auth/auth.module';
import { UserGateway } from './user.gateway';

@Module({
  providers: [UserService, UserRepo, UserRepositoryHandler, UserGateway],
  controllers: [UserController],
  imports: [TypeOrmModule.forFeature([User])],
  exports: [UserRepositoryHandler, UserRepo],
})
export class UserModule {}
