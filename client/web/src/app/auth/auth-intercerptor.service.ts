import { Injectable } from '@angular/core';
import { HttpEvent, HttpInterceptor, HttpHandler, HttpRequest } from '@angular/common/http';
import { Observable } from 'rxjs';

import { AuthService } from "./auth.service";
import { take, exhaustMap } from 'rxjs/operators';

@Injectable()
export class AuthInterceptorService implements HttpInterceptor {
  constructor(private authService: AuthService) {}

  intercept(req: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {

    return this.authService.user.pipe(
      take(1),
      exhaustMap(
        (user) => {
          if(!user || !user.token) {
            return next.handle(req)
          }
          const token = user.token
          const headers = req.headers
            .set('Authorization', `Bearer ${token}`);
          const authReq = req.clone({ headers });
          return next.handle(authReq);
        }
      )
    )

  }
}
