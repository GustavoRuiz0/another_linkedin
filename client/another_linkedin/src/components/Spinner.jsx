import ClipLoader from 'react-spinners/ClipLoader';
import PropTypes from 'prop-types';

const override = {
  display: 'block',
  margin: '100px auto'
};

const Spinner = (props) => {
  return (
    <ClipLoader
      color='#4438ca'
      loading={props.loading}
      cssOverride={override}
      size={150}
    />
  );
};

Spinner.propTypes = {
  loading: PropTypes.bool.isRequired
};

export default Spinner;
