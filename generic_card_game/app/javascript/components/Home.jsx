import React from "react";

class Home extends React.Component {
    constructor(props) {
        super(props);
    
        this.createRoom = this.createRoom.bind(this);
    }

    createRoom(){
        const createRoomURL = "/api/v1/rooms/create";

        fetch(createRoomURL, {
            method: "POST",
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
            .then(response => this.props.history.push(`/room/${response.uuid}`))
            .catch(error => console.log(error.message));
    }

    render() {
        return (
            <div className="vw-100 vh-100 primary-color d-flex align-items-center justify-content-center">
              <div className="jumbotron jumbotron-fluid bg-transparent">
                <div className="container secondary-color">
                  <h1 className="display-4">Card Game</h1>
                  <p className="lead">
                    A generic card game.
                  </p>
                  <hr className="my-4" />
                  <button
                    type="button"
                    className="btn btn-lg custom-button"
                    role="button"
                    onClick={this.createRoom}
                  >
                    New Room
                  </button>
                </div>
              </div>
            </div>
          )
    }
}

export default Home;