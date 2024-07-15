import { useEffect, useState } from 'react';
import JobListing from './JobListing';
import PropTypes from 'prop-types';
import Spinner from './Spinner';

const JobsListing = ({ isHome = false }) => {
  const [jobs, setJobs]         = useState([]);
  const [loading, setLoading]   = useState(true);

  useEffect(() => {
    const fetchJobs = async () => {
      const apiUrl = isHome
        ? '/api/jobs'
        : '/api/jobs'
      try {
        const res  = await fetch(apiUrl);
        const data = await res.json();
        setJobs(data);
      } catch (e){
        console.log('Error fetching data', e)
      } finally {
        setLoading(false)
      }
    }
    fetchJobs();
  }, [isHome])

  return (
    <>
      <section className="bg-blue-50 px-4 py-10">
        <div className="container-xl lg:container m-auto">
          <h2 className="text-3xl font-bold text-indigo-500 mb-6 text-center">
            { isHome ? 'Recent Jobs' : 'Browse Jobs'}
          </h2>
            {loading ? (
              <Spinner loading={loading} />
            ) : (
              <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
                {
                  jobs.length >= 1 && jobs.map((job) => (
                    <JobListing job={job} key={job.id} />
                ))}
              </div>
            )}
        </div>
      </section>
    </>
  )
}

JobsListing.propTypes = {
  isHome: PropTypes.bool
};
export default JobsListing