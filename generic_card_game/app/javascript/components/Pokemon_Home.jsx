import React, {useEffect, useState} from "react";
import Login from "./Login_Form";

class PokemonHome extends React.Component {

    render() {
        return <PokemonHomeContent />;
    }
}

function PokemonHomeContent() {
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

        let catchPokemon = () =>{window.open(`/pokemon/catch`)}
        let viewCollection = () =>{window.open(`/pokemon/collection`)}

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

        let actions;
        if(!login_info.isLoggedIn) {
            actions = <Login />
        } else {
            actions = (
                <ul className="horizontal">
                    <li>
                        <button
                            type="button"
                            className="btn btn-lg custom-button"
                            role="button"
                            onClick={catchPokemon}
                        >
                            Catch Pokemon
                        </button>
                    </li>
                    <li>
                        <button
                            type="button"
                            className="btn btn-lg custom-button"
                            role="button"
                            onClick={viewCollection}
                        >
                            View Collection
                        </button>
                    </li>
                    <li>
                        <button
                            type="button"
                            className="btn btn-lg custom-button"
                            role="button"
                            // onClick={this.trade}
                        >
                            Trade
                        </button>
                    </li>
                    <li>
                        <button
                            type="button"
                            className="btn btn-lg custom-button"
                            role="button"
                            onClick={logout}
                        >
                            Log out
                        </button>
                    </li>
                </ul>)
        }


        return (
            <div className="vw-100 vh-100 primary-color d-flex align-items-center justify-content-center">
                <div className="jumbotron jumbotron-fluid bg-transparent">
                    <div className="container secondary-color">
                        <h1 className="display-4">Pokemon: Collect 'em all</h1>
                        <p className="lead">
                            Catch pokemon and trade with friends to complete your collection
                        </p>
                        <hr className="my-4"/>
                        {actions}
                    </div>
                </div>
            </div>
        );

}

export default PokemonHome;
