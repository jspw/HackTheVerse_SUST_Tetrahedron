export class User {
  constructor(
    public name : string,
    public email: string,
    public id: string,
    public nid: string,
    public phone: string,
    public dateOfBirth: Date,
    public registered_at: Date,
    private role: string,
    private _token: string,
    private tokenExpirationDate: Date
) { }

  get token() {
    if (!this.tokenExpirationDate || new Date() > this.tokenExpirationDate) {
      // console.log('hit');
      return null
    }
    return this._token
  }

  get isPatient() : boolean {
    return this.role === 'patient'
  }
  get isDoctor() : boolean {
    return this.role === 'doctor'
  }
  get isPharmacy() : boolean {
    return this.role === 'pharmacy'
  }
  get isSuper() : boolean {
    return this.role === 'super-admin'
  }
}
