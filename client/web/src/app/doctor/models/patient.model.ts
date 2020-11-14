export interface PatientData {
    id: string,
    bp: string,
    name: string,
    temperature: string,
    pulse: string,
    primary_disease: string
}

export interface PatientAdmitData {
    name: string,
    age: number,
    disease: string,
    bed: string,
    note: string
}
