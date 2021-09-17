import React from "react";
import Login from "./Login_Form";
import {UserContext} from "./context/userContext";
import Gallery from 'react-grid-gallery';

class PokemonCollection extends React.Component {
    constructor(props) {
        super(props);
    
        this.goHome = this.goHome.bind(this);
        this.trade = this.trade.bind(this);
        this.state = {data: []}
    }

    goHome(){
        this.props.history.push(`/pokemon`)
    }

    trade(){
        //TODO
    }

    componentDidMount() {
        const collectionURL = "/api/v1/pokemon/collection";

        fetch(collectionURL, {
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
        let images;
        if(!userInfo.isLoggedIn || (data.status && data.status == "error" && data.code == 403)){
            content = <Login />;
        } else {
            images = generateImagesList(data);
            content = <div>
                <Gallery images={images}/>
            </div>
        }

        return (
                <div>
                    <h1 className="display-4">Your Collection {images? "(" + images.length + ")" : ""}</h1>
                    <div className="container2 secondary-color">
                        <div >
                            {content}
                        </div>

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

PokemonCollection.contextType = UserContext;

export default PokemonCollection;