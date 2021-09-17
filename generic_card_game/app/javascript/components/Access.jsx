import React, { useState, useEffect } from "react";
import Login from "./Login_Form";

export default function Access() {
    const [login_info, set_login_info] = useState({
        isLoggedIn: false,
        user: {}
    });

    useEffect(() => {
        fetch('/api/v1/access/logged_in', {
            method: "GET",
            headers: {
                "Content-Type": "application/json"
            },
        })
            .then(response => {
                if (response.ok) {
                    return response.json();
                }
                throw new Error("Network response was not ok.");
            })
            .then(response => {
                console.log(response)
                if (response.logged_in) {
                    set_login_info({
                        isLoggedIn: true,
                        user: response.user
                    })
                } else {
                    set_login_info({
                        isLoggedIn: false,
                        user: {}
                    })
                }
            })
            .catch(error => console.log(error.message));
    }, []);

    let logout = () => {
        const token = document.querySelector('meta[name="csrf-token"]').content;
        fetch('/api/v1/access/logout', {
            method: "POST",
            headers: {
                "X-CSRF-Token": token,
                "Content-Type": "application/json"
            },
        })
            .then(response => {
                if (response.ok) {
                    return response.json();
                }
                throw new Error("Network response was not ok.");
            })
            .then(response => {
                console.log(response)
            })
            .catch(error => console.log(error.message));
        set_login_info({
            isLoggedIn: false,
            user: {}
        })
    }

    if(login_info.isLoggedIn) {
        return <div>
            <p>{login_info.user.email}</p>
            <a onClick={logout}>Log out</a>
        </div>
    }
    return <div>
                <a>Log In</a>
            </div>
};
