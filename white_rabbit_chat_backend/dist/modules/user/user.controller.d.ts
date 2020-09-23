import { User } from '../../entities/user.entity';
import { UserGateway } from './user.gateway';
import { UserService } from './user.service';
export declare class UserController {
    private readonly userService;
    private readonly userGateway;
    constructor(userService: UserService, userGateway: UserGateway);
    insertUser(user: User): Promise<User>;
    deleteUser(req: any): Promise<boolean>;
    connectUserInTheServer(req: any): Promise<any>;
    disconnectUserInTheServer(req: any): Promise<any>;
}
