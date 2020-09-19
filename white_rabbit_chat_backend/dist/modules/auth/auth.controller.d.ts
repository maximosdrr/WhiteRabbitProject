import { Request } from 'express';
import { AuthService } from './auth.service';
export declare class AuthController {
    private readonly authService;
    constructor(authService: AuthService);
    login(req: Request): Promise<any>;
    getProfile(req: Request): Promise<any>;
}
