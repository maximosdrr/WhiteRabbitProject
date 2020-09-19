import { JwtService } from '@nestjs/jwt/dist/jwt.service';
import { UserRepositoryHandler } from '../user/repositories/user/handler';
export declare class AuthService {
    private readonly userRepositoryHandler;
    private readonly jwtService;
    constructor(userRepositoryHandler: UserRepositoryHandler, jwtService: JwtService);
    validateUser(username: string, password: string): Promise<any>;
    login(user: any): Promise<any>;
}
