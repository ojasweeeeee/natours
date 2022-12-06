import axios from 'axios';
import { showAlert } from './alert';


export const bookTour=async tourId=>{
    const stripe=Stripe('pk_test_51MAosUSGw1Fc2Vlc73rxiLA9Pvvclq4IZlvEixijrKq1q5PQgKLk5YEjgrvOCTUo89E42lfqKOQra2oHZxA7FJVa00zsiVkkax');

    try{
        const session=await axios(`/api/v1/bookings/checkout-session/${tourId}`);
        // console.log(session);
        await stripe.redirectToCheckout({
            sessionId: session.data.session.id
        })
    } 
    catch(err){
        console.log(err);
        showAlert('error', err);
    }
    
}