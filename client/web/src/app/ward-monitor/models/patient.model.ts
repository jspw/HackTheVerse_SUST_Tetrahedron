export interface PatientData {
    _id: string
    admitDate: string
    name: string,
    age: number,
    disease: string,
    bed: string,
    note: string
    medics: Medicine[],
    hospital: string,
    ward: string,
    sensorData: SensorData[]
}

export interface PatientAdmitData {
    name: string,
    age: number,
    disease: string,
    bed: string,
    note: string
    medics: [
        {
            name: string,
            frequency: number[],
            note: string
        }
    ],
    // hospital: string,
    // ward: string,
}

interface Medicine {
    name: string,
    frequency: number[],
    note: string
}

interface SensorData {
    name: string,
    value: string[]
}

export interface AllPatientResponseData {
    status: string,
    data: {
        patient: PatientData[]
    }
}
