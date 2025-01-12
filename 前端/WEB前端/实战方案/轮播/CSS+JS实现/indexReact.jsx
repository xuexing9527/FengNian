import React, { useState, useEffect, useRef } from 'react';

const Carousel = ({ items, itemHeight = 50, delay = 3000 }) => {
    const [index, setIndex] = useState(0);
    const carouselRef = useRef(null);

    useEffect(() => {
        const intervalId = setInterval(() => {
            setIndex((prevIndex) => {
                if (prevIndex === items.length - 1) {
                    // 无缝切换到第一条
                    setTimeout(() => {
                        carouselRef.current.style.transition = 'none'; 
                        carouselRef.current.style.transform = 'translateY(0)';
                    }, 500); // 等待过渡结束后瞬间跳回第一条
                    return prevIndex; // 保持最后一条
                } else {
                    return prevIndex + 1;
                }
            });
        }, delay);

        return () => clearInterval(intervalId);
    }, [items.length, delay]);

    useEffect(() => {
        if (index !== items.length - 1) {
            carouselRef.current.style.transition = 'transform 0.5s ease';
            carouselRef.current.style.transform = `translateY(-${index * itemHeight}px)`;
        }
    }, [index, itemHeight]);

    return (
        <div className="carousel-container" style={{ overflow: 'hidden', height: `${itemHeight}px` }}>
            <div className="carousel-items" ref={carouselRef}>
                {items.map((item, idx) => (
                    <div key={idx} style={{ height: `${itemHeight}px`, lineHeight: `${itemHeight}px` }}>
                        {item}
                    </div>
                ))}
            </div>
        </div>
    );
};

export default Carousel;
