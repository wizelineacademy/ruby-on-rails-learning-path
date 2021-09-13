import React from "react";
import Routes from "../routes/Index";
import {UserContext} from "./context/userContext";

class App extends React.Component {

    constructor(props) {
        super(props);

        this.setLoginInfo = (loggedIn, user) => {
            this.setState(state => ({
                isLoggedIn: loggedIn,
                user: user
            }));
        };

        this.logout = () => {
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
            this.setState(state => ({
                isLoggedIn: false,
                user: {}
            }));
        }

        this.state = {
            isLoggedIn: false,
            user: {},
            setLoginInfo: this.setLoginInfo,
            logout: this.logout,
        };
    }

    componentDidMount() {
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
                    this.setLoginInfo(true, response.user)
                } else {
                    this.setLoginInfo(false, {})
                }
            })
            .catch(error => console.log(error.message));

    }

    render() {

        return (
            <UserContext.Provider value={this.state}>
                {Routes}
            </UserContext.Provider>
        );
    }
};

export default App;