export class User {
    constructor(
        public id: string,
        public name: string,
        public username: string,
        public email: string,
        public phone: string,
        private role: string,
        public hospital: string,
        public registered_at: Date,
        private _token: string = null,
        public tokenExpirationDate: Date = null,
        public hospitalData: {
            verified: boolean,
            _id: string,
            name: string,
            address: string,
            verificationDataURL: string
        } = null
    ) { }

    get token() {
        if (!this._token || !this.tokenExpirationDate || new Date() > this.tokenExpirationDate) {
            // console.log('hit');
            return null
        }
        return this._token
    }

    get isPatient(): boolean {
        return this.role === 'patient'
    }

    get isNurse(): boolean {
        return this.role === 'nurse'
    }

    get isDoctor(): boolean {
        return this.role === 'doctor'
    }
    get isAdmin(): boolean {
        return this.role === 'admin'
    }

    get isWardMonitor() : boolean {
        return this.role === 'ward-monitor'
    }
}
