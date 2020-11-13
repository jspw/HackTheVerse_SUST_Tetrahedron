import { Injectable } from '@angular/core';
import { HttpClient, HttpErrorResponse, HttpResponse } from '@angular/common/http'
import { catchError, tap } from 'rxjs/operators';
import { throwError, BehaviorSubject } from 'rxjs';

import { User } from "./user.model";
import { Router } from '@angular/router';
import { environment } from 'src/environments/environment';

export interface Credentials {
  email: string
  password: string
}

export interface AuthResponseData {
  token: {
    id: string
    expiresIn: number
  }
  data: {
    user: {
      role: string,
      _id: string,
      name: string,
      email: string,
      nid: string,
      phone: string,
      dateOfBirth: string
      registered_at: string,
    }
  }
}

@Injectable({ providedIn: 'root' })
export class AuthService {

  private baseURL = environment.url
  user = new BehaviorSubject<User>(null)

  private tokenExpirationTimer: any

  constructor(private http: HttpClient, private router: Router) { }

  signUp(credentials: Credentials) {
    return this.http
      .post<AuthResponseData>(`${this.baseURL}/users`, credentials)
      .pipe(
        tap(
          res => {
            console.log(res);

            // this.handleAuthenticatedUser(res.user.email, res.user._id, res.user.createdAt, res.user.updatedAt, res.token.id, res.token.expiresIn)
          }
        ),
        catchError(this.handleError)
      )
  }

  autoLogin() {
    const userData: {
      name: string,
      email: string,
      id: string,
      nid: string,
      phone: string
      dateOfBirth: Date,
      registered_at: Date,
      role: string
      tokenExpirationDate: string,
      _token: string
    } = JSON.parse(localStorage.getItem('userData'))

    if (!userData) {
      return
    }

    const loadedUser = new User(
      userData.name,
      userData.email,
      userData.id,
      userData.nid,
      userData.phone,
      new Date(userData.dateOfBirth),
      userData.registered_at,
      userData.role,
      userData._token,
      new Date(userData.tokenExpirationDate)
    )

    if (loadedUser.token) {
      this.user.next(loadedUser)

      const tokenExpirationTimer = new Date(userData.tokenExpirationDate).getTime() - new Date().getTime()
      this.autoLogout(tokenExpirationTimer)
    }

  }

  logIn(credentials: Credentials) {
    return this.http
      .post<AuthResponseData>(`${this.baseURL}/users/login`, credentials)
      .pipe(
        tap(
          res => {
            console.log(res);

            // this.handleAuthenticatedUser(res.user.email, res.user._id, res.user.createdAt, res.user.updatedAt, res.token.id, res.token.expiresIn)
          }
        ),
        catchError(this.handleError)
      )
  }

  logout() {
    this.http.post(`${this.baseURL}/users/logout`, {}).subscribe(
      (response) => {
        this.user.next(null)
        this.router.navigate(['/auth'])
        localStorage.removeItem('userData')
        if (this.tokenExpirationTimer) {
          clearTimeout(this.tokenExpirationTimer)
        }
        this.tokenExpirationTimer = null
      },
      error => console.log(error)
    )
  }

  autoLogout(tokenExpirationDuration: number) {
    console.log(tokenExpirationDuration);

    this.tokenExpirationTimer = setTimeout(() => {
      this.logout()
    }, tokenExpirationDuration)
  }

  private handleAuthenticatedUser(
    role: string,
    userId: string,
    name: string,
    email: string,
    nid: string,
    phone: string,
    dateOfBirth_at: string,
    registered_time: string,
    tokenId: string,
    expiresIn: number
  ) {
    const expirationDate = new Date(new Date().getTime() + expiresIn)
    const registered_at = new Date(registered_time)
    const dateOfBirth = new Date(dateOfBirth_at)
    const user = new User(name, email, userId,nid,phone,dateOfBirth, registered_at,role, tokenId, expirationDate)
    // const user = new User(email, userId, registered_at, lastEditedAt, tokenId, expirationDate)

    localStorage.setItem('userData', JSON.stringify(user))
    this.autoLogout(expiresIn)

    this.user.next(user)
  }

  private handleError(error: HttpErrorResponse) {
    console.log(error);

    let errorMessage = 'An unknown Error'
    if (!error.error || !error.error.error) {
      return throwError(errorMessage)
    }
    switch (error.error.error) {
      case 'EMAIL_EXISTS':
        errorMessage = 'Email Already in Use!'
        break;
      case 'Invalid Credentials':
        errorMessage = 'Invalid Credentials!'
        break;

      default:
        break;
    }
    return throwError(errorMessage)

  }

}
