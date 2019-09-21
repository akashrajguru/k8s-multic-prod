import React from 'react';
import { Link } from 'react-router-dom';
import './App.css';


export default () =>{
    return (
        <div>
            Im some other page!
            <Link to="/">Go back home</Link>
        </div>
    );
};