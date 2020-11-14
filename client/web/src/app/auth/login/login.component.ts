import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { Observable } from 'rxjs';
import { AuthService } from '../auth.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  authenticationForm: FormGroup
  isLoginMode: boolean = true

  constructor(private authService: AuthService, private router: Router) { }

  ngOnInit(): void {
    this.formInit()
  }

  private formInit() {
    this.authenticationForm = new FormGroup({
      username: new FormControl(null, [Validators.required]),
      password: new FormControl(null, [Validators.required, Validators.minLength(6)]),
      // role: new FormControl('patient', [Validators.required])
    })
  }

  onSwitchMode() {
    this.isLoginMode = !this.isLoginMode
  }

  private authObservalbe: Observable<any>

  onSubmit() {

    if (this.authenticationForm.invalid) {
      return
    }
    console.log(this.authenticationForm.value);
    const { username, password } = this.authenticationForm.value

    this.authObservalbe = this.authService.logIn({ username, password })


    this.authObservalbe.subscribe(
      res => {
        console.log(res)
        // this.router.navigate(['/recipes'])
      },
      errorMessage => {
      }
    )

    this.authenticationForm.reset()
  }
}
