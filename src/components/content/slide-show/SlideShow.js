import { useState, useEffect } from 'react';
import PropTypes from 'prop-types';
import './SlideShow.scss';

const SlideShow = (props) => {
  const { images, auto, showArrows } = props;
  const [state, setState] = useState({
    slideShow: images[0],
    slideIndex: 0
  });

  const { slideShow, slideIndex } = state;
  const [currentIndex, setCurrentIndex] = useState(0);
  const [sliderInterval, setSliderInterval] = useState(0);
  let currentSlideIndex = 0;

  useEffect(() => {
    if (auto) {
      const timeInterval = setInterval(() => {
        autoMoveSlide();
      }, 5000);
      setSliderInterval(timeInterval);

      return () => {
        clearInterval(timeInterval);
        clearInterval(sliderInterval);
      };
    }
  }, [images]);

  const autoMoveSlide = () => {
    let lastIndex = 0;
    lastIndex = currentSlideIndex + 1;
    currentSlideIndex = lastIndex >= images.length ? 0 : lastIndex;
    setState((prev) => ({
      ...prev,
      slideShow: images[currentSlideIndex],
      slideIndex: currentSlideIndex
    }));
  };

  const moveSliderWithArrows = (type) => {
    let index = currentIndex;
    if (type === 'prev') {
      if (currentIndex <= 0) {
        index = images.length - 1;
      } else {
        index -= 1;
      }
    } else {
      if (currentIndex < images.length) return (index += 1);
      if (images === images.length) return (index = 0);
    }
    setCurrentIndex(index);
    setState((prev) => ({
      ...prev,
      slideShow: images[index],
      slideIndex: index
    }));
  };

  // SideArrows
  const RenderArrows = () => {
    return (
      <div className="slider-arrows">
        <div className="slider-arrow slider-arrow--left" onClick={() => moveSliderWithArrows('prev')} />
        <div className="slider-arrow slider-arrow--right" onClick={() => moveSliderWithArrows('next')} />
      </div>
    );
  };

  //  Indicator buttons
  const Indicators = (props) => {
    const { currentSlide } = props;
    const listIndicators = images.map((slide, i) => {
      const btnClasses = i === currentSlide ? 'slider-navButton slider-navButton--active' : 'slider-navButton';
      return <button className={btnClasses} key={i} />;
    });
    return <div className="slider-nav">{listIndicators}</div>;
  };

  return (
    <>
      <div className="slider">
        <div className="slider-slides">
          {images && images.length && slideShow && (
            <div className="slider-image" style={{ backgroundImage: `url(${slideShow.url})` }}></div>
          )}
        </div>
        <Indicators currentSlide={slideIndex} />
        {!showArrows ? <RenderArrows /> : null}
      </div>
    </>
  );
};

SlideShow.propTypes = {
  images: PropTypes.array.isRequired,
  auto: PropTypes.bool.isRequired,
  showArrows: PropTypes.bool.isRequired,
  currentSlide: PropTypes.number
};

export default SlideShow;
