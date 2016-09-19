var Upvote = React.createClass({
  getInitialState: function() {
      return {
        proposal: this.props.proposal
      };
  },
render: function() {
  var divClasses = classNames({
    "proposal-upvote": true,
    "proposal-upvote-upvoted": this.props.proposal.up_voted
  });

  return (
    <div className={divClasses} onClick={this.handleClick}>
      <div className="proposal-arrow"></div>
      <div className='proposal-count'>
        {this.state.proposal.up_votes}
      </div>
    </div>
    );
  },


  handleClick: function() {
    var that = this;
    $.ajax({
      type: 'POST',
      url: Routes.upvote_proposal_path(this.props.proposal.id, {format: 'json'}),
      success: function(data) {
        that.setState({ proposal: data });
      }
    });
  }
});
