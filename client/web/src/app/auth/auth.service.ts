import { Injectable } from '@angular/core';
import { HttpClient, HttpErrorResponse, HttpResponse } from '@angular/common/http'
import { catchError, take, tap } from 'rxjs/operators';
import { throwError, BehaviorSubject } from 'rxjs';

import { Router } from '@angular/router';
import { environment } from 'src/environments/environment';
import { User } from './models/user.model';

export interface Credentials {
  username: string
  password: string
}

export interface AuthResponseData {
  status: string
  jwt: {
    token: string
    expiresIn: string
  }
  data: {
    user: {
      _id: string,
      name: string,
      username: string,
      email: string,
      phone: string,
      role: string,
      hospital: string
      registered_at: string,
      __v: number
    },
    hospital: {
      verified: boolean,
      _id: string,
      name: string,
      address: string
      verificationDataURL: string
      __v: number
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
    // return this.http
    //   .post<AuthResponseData>(`${this.baseURL}/admin/register`, credentials)
    //   .pipe(
    //     tap(
    //       res => {
    //         console.log(res);

    //         this.handleAuthenticatedUser(
    //           res.data.user._id,
    //           res.data.user.name,
    //           res.data.user.username,
    //           res.data.user.email,
    //           res.data.user.phone,
    //           res.data.user.role,
    //           res.data.user.hospital,
    //           res.data.user.registered_at,
    //           res.jwt.expiresIn,
    //           res.jwt.token,
    //           res.data.hospital
    //         )
    //       }
    //     ),
    //     catchError(this.handleError)
    //   )
  }

  autoLogin() {
    const userData: {
      id: string,
      name: string,
      username: string,
      email: string,
      phone: string,
      role: string,
      hospital: string,
      registered_at: Date,
      _token: string,
      tokenExpirationDate: string,
      hospitalData?: {
        verified: boolean,
        _id: string,
        name: string,
        address: string
        verificationDataURL: string
        __v: number
      }
    } = JSON.parse(localStorage.getItem('userData'))

    if (!userData) {
      return
    }

    const loadedUser = new User(
      userData.id,
      userData.name,
      userData.username,
      userData.email,
      userData.phone,
      userData.role,
      userData.hospital,
      userData.registered_at,
      userData._token,
      new Date(userData.tokenExpirationDate),
      userData.hospitalData
    )
    // const loadedUser = new User(
    //   userData.name,
    //   userData.email,
    //   userData.id,
    //   userData.phone,
    //   userData.registered_at,
    //   userData.role,
    //   userData._token,
    //   new Date(userData.tokenExpirationDate)
    // )

    if (loadedUser.token) {
      this.user.next(loadedUser)

      const tokenExpirationTimer = new Date(userData.tokenExpirationDate).getTime() - new Date().getTime()
      console.log(tokenExpirationTimer);

      this.autoLogout(tokenExpirationTimer)
      this.handleAuthenticatedUserNavigation(loadedUser)
    }

  }

  logIn(credentials: Credentials) {
    return this.http
      .post<AuthResponseData>(`${this.baseURL}/admin/login`, credentials)
      .pipe(
        tap(
          res => {
            console.log(res);

            this.handleAuthenticatedUser(
              res.data.user._id,
              res.data.user.name,
              res.data.user.username,
              res.data.user.email,
              res.data.user.phone,
              res.data.user.role,
              res.data.user.hospital,
              res.data.user.registered_at,
              res.jwt.expiresIn,
              res.jwt.token,
              res.data.hospital
            )
            // this.handleAuthenticatedUser(res.user.email, res.user._id, res.user.createdAt, res.user.updatedAt, res.token.id, res.token.expiresIn)
          }
        ),
        catchError(this.handleError)
      )
  }

  logout() {
    this.user.next(null)
    this.router.navigate(['/auth'])
    localStorage.removeItem('userData')
    if (this.tokenExpirationTimer) {
      clearTimeout(this.tokenExpirationTimer)
    }
    this.tokenExpirationTimer = null

  }

  autoLogout(tokenExpirationDuration: number) {
    console.log(tokenExpirationDuration);

    this.tokenExpirationTimer = setTimeout(() => {
      this.logout()
    }, tokenExpirationDuration)
  }

  private handleAuthenticatedUser(
    id: string,
    name: string,
    username: string,
    email: string,
    phone: string,
    role: string,
    hospital: string,
    registered_time: string,
    expiresIn: string,
    _token: string = null,
    hospitalData: {
      verified: boolean,
      _id: string,
      name: string,
      address: string,
      verificationDataURL: string
    } = null
  ) {
    const expirationDate = new Date(new Date().getTime() + parseInt(expiresIn))
    console.log(expirationDate);

    const registered_at = new Date(registered_time)
    const user = new User(
      id,
      name,
      username,
      email,
      phone,
      role,
      hospital,
      registered_at,
      _token,
      expirationDate,
      hospitalData
    )
    // const user = new User(email, userId, registered_at, lastEditedAt, tokenId, expirationDate)

    localStorage.setItem('userData', JSON.stringify(user))
    this.autoLogout(parseInt(expiresIn))

    this.user.next(user)
    this.handleAuthenticatedUserNavigation(user)
  }

  private handleAuthenticatedUserNavigation(authUser: User) {
    if (authUser) {
      if (authUser.isAdmin) {
        this.router.navigate(['admin'])
      }
    }
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
