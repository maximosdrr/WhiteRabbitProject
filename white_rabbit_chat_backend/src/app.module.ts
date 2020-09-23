import { Module } from '@nestjs/common';
import { UserModule } from './modules/user/user.module';
import { AuthModule } from './modules/auth/auth.module';
import { MessengerModule } from './modules/messenger/messenger.module';
import { ConfigModule } from '@nestjs/config';
import { TypeOrmModule } from '@nestjs/typeorm';

@Module({
  //Usem os arquivos .env para configurar o servidor
  imports: [
    UserModule,
    AuthModule,
    MessengerModule,
    ConfigModule.forRoot({
      envFilePath: ['src/env/api.secret.env', 'ormConfig.env'],
      isGlobal: true,
    }),
    TypeOrmModule.forRoot(),
  ],
  controllers: [],
  providers: [],
})
export class AppModule {}
