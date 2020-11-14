import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { Observable } from 'rxjs';
import { AuthService } from '../auth.service';

@Component({
  selector: 'app-registration',
  templateUrl: './registration.component.html',
  styleUrls: ['./registration.component.css']
})
export class RegistrationComponent implements OnInit {

  authenticationForm: FormGroup
  isLoginMode: boolean = false

  constructor(private authService: AuthService, private router: Router) { }

  ngOnInit(): void {
    this.formInit()
  }

  private formInit() {
    this.authenticationForm = new FormGroup({
      email: new FormControl(null, [Validators.required, Validators.email]),
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
    // const { email, password } = this.authenticationForm.value
    // this.authObservalbe = this.authService.signUp({ email, password })

    // this.authObservalbe.subscribe(
    //   res => {
    //     console.log(res)
    //     // this.router.navigate(['/recipes'])
    //   },
    //   errorMessage => {
    //   }
    // )

    this.authenticationForm.reset()
  }

}
