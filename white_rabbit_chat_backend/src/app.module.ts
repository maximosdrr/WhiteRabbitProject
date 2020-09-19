import { Module } from '@nestjs/common';
import { UserModule } from './modules/user/user.module';
import { AuthModule } from './modules/auth/auth.module';
import { MessengerModule } from './modules/messenger/messenger.module';
import { ConfigModule } from '@nestjs/config';
import { TypeOrmModule } from '@nestjs/typeorm';
import { User } from './modules/user/entities/user.entity';
import { Message } from './modules/messenger/entities/message.entity';
import { MessengerGateway } from './modules/messenger/messenger.gateway';

@Module({
  imports: [
    UserModule,
    AuthModule,
    MessengerModule,
    ConfigModule.forRoot({
      envFilePath: ['src/env/orm.config.env', 'src/env/api.secret.env'],
      isGlobal: true,
    }),
    TypeOrmModule.forRoot({
      type: 'mysql',
      host: 'localhost',
      port: 3306,
      username: 'root',
      password: '',
      database: 'white_rabbit',
      entities: [User, Message],
      synchronize: true,
    }),
  ],
  controllers: [],
  providers: [],
})
export class AppModule {}
