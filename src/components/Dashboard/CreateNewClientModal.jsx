import React, { useState } from 'react';
import { useDispatch, useSelector } from 'react-redux';


function CreateNewClientModal() {
    const dispatch = useDispatch();
    const user = useSelector((store) => store.user);

    const [companyNameInput, setCompanyNameInput] = useState('');
    const [contactPersonInput, setContactPersonInput] = useState('');
    const [emailInput, setEmailInput] = useState('');
    const [dateInput, setDateInput] = useState('');

    const handleSubmit = (event) => {
        // event.preventDefault();
        const id = user.id
        let newCompany = {
            companyName: companyNameInput,
            contactPerson: contactPersonInput,
            emailInput: emailInput,
            date: dateInput,
            userId: id
        }
        // console.log('new company', newCompany)
        dispatch({ 
            type: 'SAGA/POST_CLIENT',
            payload: newCompany
        });
        clearNewClientForm();
    }
    const clearNewClientForm = () => {
        setCompanyNameInput('');
        setContactPersonInput('');
        setEmailInput('');
        setDateInput('');
      }

    return(
    <div>
        <button type="button" className="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
            Create New Client
        </button>

        <div className="modal fade" id="exampleModal" tabIndex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div className="modal-dialog">
        <div className="modal-content">
            <div className="modal-header">
            <h1 className="modal-title fs-5" id="exampleModalLabel">Create New Client</h1>
            <button type="button" className="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div className="modal-body text-center">
            <div>
                <h5>Company Name</h5>
                <input
                type='text'
                value={companyNameInput}
                onChange={(evt) => setCompanyNameInput(evt.target.value)} 
                />
            </div>
            <div>
                <h5>Contact Person</h5>
                <input
                type='text'
                value={contactPersonInput}
                onChange={(evt) => setContactPersonInput(evt.target.value)} 
                />
            </div>
            <div>
            <h5>E-mail Address</h5>
                <input
                type='text'
                value={emailInput}
                onChange={(evt) => setEmailInput(evt.target.value)} 
                />
            </div>
            <div>
             {/* date could be fixed here but for the sake of time I just made it type='text' */}
            <h5>Engagement Date</h5>
                <input
                type='text'
                placeholder="year-mm-dd"
                value={dateInput}
                onChange={(evt) => setDateInput(evt.target.value)} 
                />
            </div>
            </div>
            <div className="modal-footer">
            <button type="button" className="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            <button type="button" className="btn btn-primary" onClick={handleSubmit} data-bs-dismiss="modal">Submit</button>
            </div>
        </div>
        </div>
        </div>
        {/* <div className="grid-col grid-col_4">
        <button type="button" className="btn btn-primary">Create New Client</button>
        </div> */}

    </div>

    );
}

export default CreateNewClientModal
