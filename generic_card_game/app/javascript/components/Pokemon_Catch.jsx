import React from "react";
import { LazyLoadImage } from 'react-lazy-load-image-component';
import Login from "./Login_Form";
import {UserContext} from "./context/userContext";
import Gallery from 'react-grid-gallery';

class PokemonCatch extends React.Component {
    constructor(props) {
        super(props);
    
        this.goHome = this.goHome.bind(this);
        this.trade = this.trade.bind(this);

        this.state = {
            data: []
        }
    }

    goHome(){
        this.props.history.push(`/pokemon`)
    }

    trade(){
        //TODO
    }

    componentDidMount() {
        const catchURL = "/api/v1/pokemon/catch";
        fetch(catchURL, {
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
            .then(response => this.setState({data: response}))
            .catch(error => console.log(error.message));

    }

    render() {
        let userInfo = this.context;
        let data = this.state.data

        let content;
        if(!userInfo.isLoggedIn || (data.status && data.status == "error" && data.code == 403)){
            content = <Login />;
        } else {
            if (data.length > 0) {
                let images = generateImagesList(data);
                content = (<div>
                    <h1 className="display-4">Wild Pokemon Found!</h1>
                    <ul className="horizontal">
                        <Gallery images={images}/>
                    </ul>
                </div>);
            } else {
                content = (<div>
                    <h1 className="display-4">Catching Pokemon</h1>
                    <p className="lead">
                        Searching pokemon in the wild...
                    </p>
                </div>);
            }
        }

        return (
            <div className="vw-100 vh-100 primary-color d-flex align-items-sm-center justify-content-center">
                <div className="jumbotron jumbotron-fluid bg-transparent">
                    <div className="container secondary-color">
                        {content}
                        <br />
                        <hr className="my-4"/>
                        <ul className="horizontal">
                            <li>
                                <button
                                    type="button"
                                    className="btn btn-lg custom-button"
                                    role="button"
                                    onClick={this.goHome}
                                >
                                    Back Home
                                </button>
                            </li>
                            <li>
                                <button
                                    type="button"
                                    className="btn btn-lg custom-button"
                                    role="button"
                                    onClick={this.trade}
                                >
                                    Trade
                                </button>
                            </li>
                            <li>
                                <button
                                    type="button"
                                    className="btn btn-lg custom-button"
                                    role="button"
                                    onClick={userInfo.logout}
                                >
                                    Log out
                                </button>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        );
    }
}

function generateImagesList(srcData){
    return srcData.map(card =>
        {
            return{
                src: card.image,
                thumbnail: card.image_thumbnail,
                thumbnailWidth: 240,
                thumbnailHeight: 330,
                // isSelected: true,
                caption: card.name
            }
        }
    );
}

PokemonCatch.contextType = UserContext;

export default PokemonCatch;