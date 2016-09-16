var ProposalListItem = React.createClass({
  render: function() {
    return (
      <div className="proposal">
        <div className="proposal-upvote">
          <Upvote proposal={this.props.proposal} />
        </div>
        <div className="proposal-body">
          <h3>
            <a href={this.props.proposal.url} target="_blank">{this.props.proposal.subject}</a>
          </h3>
          <p>{this.props.proposal.content}</p>
          <p>{this.props.proposal.location}</p>
          <p>{this.props.proposal.price}</p>
        </div>
        // <div className="proposal-controls">
        //   <div className="proposal-control">
        //     <div className="user-badge-container ">
        //
        //     </div>
        //   </div>
        // </div>
      </div>
    );
  }
});